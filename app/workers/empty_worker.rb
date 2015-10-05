# criado apenas para fazer o cartridge do sidekiq funcionar no openshift, pois é necessário ao menos um worker na pasta de workers (https://github.com/openshift-cartridges/openshift-origin-cartridge-sidekiq/issues/5)
class EmptyWorker
  include Sidekiq::Worker

  def perform
  end
end
