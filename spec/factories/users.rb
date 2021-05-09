FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {'test@test.com'}
    password {'test@pass'}
    password_confirmation {password}
    last_name {'t_last'}
    first_name {'t_first'}
    last_name_katakana {'t_l_k'}
    first_name_katakana {'t_f_k'}
    birthday {'1992/09/19'}
    
  end
end
