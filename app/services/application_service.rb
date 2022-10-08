# frozen_string_literal: true

class ApplicationService
  include Dry::Transaction(step_adapters: MyAdapters)
end
