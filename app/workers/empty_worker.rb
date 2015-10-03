# criado apenas para fazer o cartridge do sidekiq funcionar no openshift, pois é necessário ao menos um worker na pasta de workers
class EmptyWorker
  include Sidekiq::Worker

  def perform
  end
end
