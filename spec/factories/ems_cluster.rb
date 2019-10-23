FactoryBot.define do
  factory :ems_cluster do
    sequence(:name) { |n| "cluster_#{seq_padded_for_sorting(n)}" }
  end

  factory :cluster_target, :parent => :ems_cluster do
    after(:create) do |x|
      x.perf_capture_enabled = toggle_on_name_seq(x)
    end
  end
  factory :ems_cluster_openstack, :class => "ManageIQ::Providers::Openstack::InfraManager::Cluster", :parent => :ems_cluster
  factory :ems_cluster_ovirt, :class => "ManageIQ::Providers::Redhat::InfraManager::Cluster", :parent => :ems_cluster
end
