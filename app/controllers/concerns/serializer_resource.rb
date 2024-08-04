module SerializerResource 
  extend ActiveSupport::Concern

  def serialize_resource(resource, serializer)
    ActiveModelSerializers::SerializableResource.new(resource, each_serializer: serializer)
  end
end