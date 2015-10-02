FactoryGirl.define do
  factory :candidate do
    skip_create

    name "Teste"
    email "teste@teste.com"

    factory :front_end_developer do
      html 8
      css 7
      javascript 10
    end

    factory :back_end_developer do
      django 9
      python 10
    end

    factory :ios_developer do
      dev_ios 8
    end

    factory :android_developer do
      dev_android 7
    end
  end
end
