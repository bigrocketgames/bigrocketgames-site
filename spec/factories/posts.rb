FactoryBot.define do
  factory :post do
    title " Title of a post"
    body "<p>This is my post.</p>  <p>It is wonderful.  Please love it.</p>"
    status 0
    publishedDate "2018-02-12"
  end
end
