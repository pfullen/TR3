FactoryGirl.define do
  factory :shift_info do
    shift_id 1
    shift_days "MyString"
    shift_start_time "2017-08-16 11:13:53"
    shift_end_time "2017-08-16 11:13:53"
    notes "MyText"
    roster nil
  end
end
