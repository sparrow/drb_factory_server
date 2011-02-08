if Rails.env.test?
  require 'drb'

  module DRbFactory

    class DRbActiveRecordInstanceFactory
      @@port = 9000

      def self.port=(port)
        @@port = port  
      end

      def self.get_new_port
        port = @@port
        @@port += 1
        port
      end

      def get_port_for_factory(factory_name)
        port = DRbActiveRecordInstanceFactory.get_new_port
        inst = Factory.create(factory_name)
        DRb.start_service("druby://localhost:#{port}", inst)
        port
      end

    end

    DRbActiveRecordInstanceFactory.port = YAML.load_file(Rails.root.join('config', 'drb_factory.yml'))['port'] if File::exists?(Rails.root.join('config', 'drb_factory.yml'))
    DRb.start_service("druby://localhost:#{DRbActiveRecordInstanceFactory.get_new_port}", DRbActiveRecordInstanceFactory.new)
  end
end