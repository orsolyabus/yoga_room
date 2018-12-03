class TestJob < ApplicationJob
  queue_as :default

  def perform
    puts "---------------"
    puts "repeat job repeating"
  end
end
