if Rails.env.test?
  
  require 'drb'

  module DRbFactory

    class DRbActiveRecordFactory
      
      @@port = 9000

      def self.port=(port)
        @@port = port  
      end

      def self.get_new_port
        port = @@port
        @@port += 1
        port
      end

      def self.start_service
        DRb.start_service("druby://localhost:#{DRbActiveRecordFactory.get_new_port}", DRbActiveRecordFactory.new)
      end

      def get_port_for_factory(factory_name)
        port = DRbActiveRecordFactory.get_new_port
        inst = Factory.create(factory_name)
        DRb.start_service("druby://localhost:#{port}", inst)
        port
      end
      
    end
    
  end
  
end