describe "vpn requests" do
  let(:vpn_format) do
    {
      "id"                  => String,
      "customer"            => String,
      "modified_by"         => String,
      "name"                => String,
      "description"         => String,
      "vpn_type"            => String,
      "default_route"       => Fog::Boolean,
      "requested_state"     => String,
      "created_by"          => String,
      "instance"            => String,
      "modified_time"       => String,
      "created_time"        => String,
      "internet_ip_address" => Fog::Nullable::String,
      "computing_cell"      => String,
      "metadata"            => Hash
    }
  end

  before(:all) { @cell = create_computing_cell }

  after(:all) { delete_computing_cell(@cell) }

  describe "#create_vpn" do
    before(:all) do
      @vpn_name = Fog::Brkt::Mock.name
      @response = compute.create_vpn(@cell.id, {
        name:     @vpn_name,
        vpn_type: Fog::Compute::Brkt::Vpn::Type::OPENVPN
      })
    end

    after(:all) { compute.delete_vpn(@response.body["id"]) }

    describe "response" do
      subject { @response.body }

      it { is_expected.to have_format(vpn_format) }
      it { expect(subject["id"]).to_not be_nil }
      it { expect(subject["name"]).to eq @vpn_name }
    end
  end

  describe "#list_vpns" do
    before(:all) do
      @vpn = compute.vpns.create(
        :name            => Fog::Brkt::Mock.name,
        :computing_cell  => @cell.id,
        :vpn_type        => Fog::Compute::Brkt::Vpn::Type::OPENVPN
      )

      @response = compute.list_vpns(@cell.id)
    end

    after(:all) { @vpn.destroy }

    describe "response" do
      subject { @response.body }

      it { is_expected.to have_format([vpn_format]) }
    end
  end
end
