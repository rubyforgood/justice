ActiveRecord::Base.transaction do
  # CMS ite, layout and pages
  if Comfy::Cms::Site.count == 0
    site = Comfy::Cms::Site.create!(label: 'Justice for Juniors', identifier: 'justice-for-juniors', hostname: 'localhost')

    page_layout_content = <<-content
      {{ cms:page:content:rich_text }}

      {{ cms:page_file:hero_image:field[983x371#] }}

      {{ cms:page_file:image_1:field[320x234#] }}
      {{ cms:field:image_1_caption:string }}
      {{ cms:field:image_1_link:string }}

      {{ cms:page_file:image_2:field[320x234#] }}
      {{ cms:field:image_2_caption:string }}
      {{ cms:field:image_2_link:string }}
    content

    home_layout_content = <<-content
      {{ cms:page:content:rich_text }}

      {{ cms:page_file:hero_image:field[640x488#] }}
      {{ cms:field:hero_image_caption:string }}
      {{ cms:field:hero_image_link:string }}

      {{ cms:page_file:side_image_1:field[320x234#] }}
      {{ cms:field:side_image_1_caption:string }}
      {{ cms:field:side_image_1_link:string }}

      {{ cms:page_file:side_image_2:field[320x234#] }}
      {{ cms:field:side_image_2_caption:string }}
      {{ cms:field:side_image_2_link:string }}
    content

    page_layout = Comfy::Cms::Layout.new(app_layout: 'page', label: 'Page Layout', identifier: 'page-layout', content: page_layout_content)
    home_layout = Comfy::Cms::Layout.new(app_layout: 'home_page', label: 'Home Layout', identifier: 'home-layout', content: home_layout_content)
    site.layouts << page_layout
    site.layouts << home_layout

    site.pages << Comfy::Cms::Page.new(layout_id: home_layout.id, label: 'Home Page1')
  end


  # User, Lessons...
  if Term.count == 0
    10.times do
      Term.create(name: Faker::Hipster.word)
    end
  end

  if User.count == 0
    10.times do
      User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password',
        suspended: false,
        approved: true
      )
    end
  end

  if Lesson.count == 0
    20.times do
      lesson = Lesson.create(
        lesson_type: Lesson::LESSON_TYPES.sample,
        title: Faker::Book.title,
        body:  Faker::Lorem.paragraphs(rand(1..4)),
        questions: Faker::StarWars.quote + '?',
        # randomly assigns user to lesson
        user_id: User.order('RANDOM()').first.id
      )

      3.times do
        lesson.lesson_terms.create(term: Term.order('RANDOM()').take)
      end
    end
  end
end