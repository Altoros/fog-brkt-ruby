describe "billing group requests" do
  customer_id = "ffffffffffff4fffafffffffffffff00"

  let(:billing_group_format) do
    {
      'customer'          => String,
      'spent_cost'        => String,
      'modified_by'       => String,
      'name'              => String,
      'refundable_cost'   => String,
      'description'       => Fog::Nullable::String,
      'created_by'        => String,
      'allocated_cost'    => String,
      'allocated_balance' => String,
      'modified_time'     => String,
      'members'           => String,
      'number_of_members' => Integer,
      'created_time'      => String,
      'metadata'          => Hash,
      'max_hourly_rate'   => Fog::Nullable::Integer,
      'id'                => String,
      'parent_balance'    => String
    }
  end

  describe "#create_billing_group" do
    before(:all) do
      @response = compute.create_billing_group(customer_id, "name", {
        description: "description",
        members:     ["user@example.com"]
      })
      @billing_group_id = @response.body["id"]
    end

    after(:all) do
      compute.delete_billing_group(@billing_group_id)
    end

    describe "response" do
      subject { @response.body }

      it { is_expected.to have_format(billing_group_format) }
      it { expect(subject["id"]).to_not be_nil }
      it { expect(subject["customer"]).to eq customer_id }
      it { expect(subject["name"]).to eq "name" }
      it { expect(subject["description"]).to eq "description" }
      it { expect(subject["number_of_members"]).to eq 1 }
    end
  end

  describe "#list_billing_groups" do
    before(:all) do
      @billing_group = compute.billing_groups.create(:customer_id => customer_id, :name => "test")
      @response = compute.list_billing_groups
    end

    after(:all) { @billing_group.destroy }

    describe "response" do
      subject { @response.body }

      it { is_expected.to have_format([billing_group_format]) }
    end
  end
end
