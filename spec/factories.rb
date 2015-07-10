FactoryGirl.define do


 factory :user do
  	name('jocelyn alsdorf')
    sequence(:email) {|n| "test#{n}@example.com" }
    password('12345678')
    
  end

  factory(:skill) do
    name('reading')
    description('books')

  end  

  factory(:project) do
    title('my fav')
    content('some stuff')
    link('www.fake.com')

  end  

  factory(:post) do
    title('fake post')
    body('some text for a post')
  end



  factory(:comment) do
  	content('this sucks')
  end  

end
