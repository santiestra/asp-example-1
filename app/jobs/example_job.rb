# frozen_string_literal: true

class ExampleJob < ApplicationJob
  def perform
    puts 'This is an example'
  end
end
