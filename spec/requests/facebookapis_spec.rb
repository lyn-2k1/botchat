 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/facebookapis", type: :request do
  # Facebookapi. As you add validations to Facebookapi, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Facebookapi.create! valid_attributes
      get facebookapis_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      facebookapi = Facebookapi.create! valid_attributes
      get facebookapi_url(facebookapi)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_facebookapi_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      facebookapi = Facebookapi.create! valid_attributes
      get edit_facebookapi_url(facebookapi)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Facebookapi" do
        expect {
          post facebookapis_url, params: { facebookapi: valid_attributes }
        }.to change(Facebookapi, :count).by(1)
      end

      it "redirects to the created facebookapi" do
        post facebookapis_url, params: { facebookapi: valid_attributes }
        expect(response).to redirect_to(facebookapi_url(Facebookapi.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Facebookapi" do
        expect {
          post facebookapis_url, params: { facebookapi: invalid_attributes }
        }.to change(Facebookapi, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post facebookapis_url, params: { facebookapi: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested facebookapi" do
        facebookapi = Facebookapi.create! valid_attributes
        patch facebookapi_url(facebookapi), params: { facebookapi: new_attributes }
        facebookapi.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the facebookapi" do
        facebookapi = Facebookapi.create! valid_attributes
        patch facebookapi_url(facebookapi), params: { facebookapi: new_attributes }
        facebookapi.reload
        expect(response).to redirect_to(facebookapi_url(facebookapi))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        facebookapi = Facebookapi.create! valid_attributes
        patch facebookapi_url(facebookapi), params: { facebookapi: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested facebookapi" do
      facebookapi = Facebookapi.create! valid_attributes
      expect {
        delete facebookapi_url(facebookapi)
      }.to change(Facebookapi, :count).by(-1)
    end

    it "redirects to the facebookapis list" do
      facebookapi = Facebookapi.create! valid_attributes
      delete facebookapi_url(facebookapi)
      expect(response).to redirect_to(facebookapis_url)
    end
  end
end
