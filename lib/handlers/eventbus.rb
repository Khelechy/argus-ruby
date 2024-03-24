
class EventBus
    ARGUSEVENTNAME = "argus.event.received"

    def initialize
        @subscribers = Hash.new{|h,k| h[k] = []}
    end

    def subscribe(subscriber, method_name)
        @subscribers[ARGUSEVENTNAME] << [subscriber, method_name]
    end

    def publish(data = nil)
        @subscribers[ARGUSEVENTNAME].each do |subscriber, method_name|
            subscriber.send(method_name, data) if subscriber.respond_to?(method_name)
        end
    end
end
