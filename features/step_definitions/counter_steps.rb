
Given(/^I have a counter$/) do
  @counter = 0
end

When(/^I increment it$/) do
  @counter += 1
end

Then(/^I should see it is (\d+)$/) do |expected_count|
  raise "OH NOES, expected #{expected_count}, got #{@counter}" if expected_count.to_i != @counter
end
