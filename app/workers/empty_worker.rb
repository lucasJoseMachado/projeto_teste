class EmptyWorker
  include Sidekiq::Worker

  def perform
  end
end
