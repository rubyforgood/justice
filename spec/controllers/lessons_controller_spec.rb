require 'rails_helper'

RSpec.describe LessonsController, :type => :controller do
  before do
    @lesson = FactoryGirl.create(:lesson)
  end

  it "get index" do
    get :index
    expect(response.status).to eq 200
  end

  it "get new" do
    get :new
    expect(response.status).to eq 200
  end

  it "create lesson" do
    expect{ post :create, lesson: FactoryGirl.attributes_for(:lesson)
          }.to change{ Lesson.count }.by(1)
  end

  it "creates lesson and redirects" do
    post :create,
      { lesson: FactoryGirl.attributes_for(:lesson) }

    expect(response).to redirect_to(lesson_url(Lesson.last))
  end

  it "show lesson" do
    get :show, id: @lesson.id
    expect(response.status).to eq 200
  end

  it "get edit" do
    get :edit, id: @lesson.id
    expect(response.status).to eq 200
  end

  it "update lesson" do
    patch :update, id: @lesson.id, lesson: FactoryGirl.attributes_for(:lesson)
    expect(response).to redirect_to(lesson_url(@lesson))
  end

  it "destroy lesson" do
    expect{
            delete :destroy, id: @lesson.id
          }.to change{ Lesson.count }.by(-1)

    expect(response).to redirect_to(lessons_url)
  end

  it "destroy lesson and redirect" do
    delete :destroy, id: @lesson.id
    expect(response).to redirect_to(lessons_url)
  end
end
