# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:project) { create(:project) }

  context "when user is logged in" do
    include_context "when user logged in"

    describe "POST /create" do
      it "redirects with notice" do
        post project_comments_path(project), params: { comment: attributes_for(:comment) }

        expect(response).to redirect_to(project_path(project))
        expect(flash[:notice]).to eq("Comment was successfully created.")
      end

      it "creates comment" do
        expect { post project_comments_path(project), params: { comment: attributes_for(:comment) } }
          .to change(Comment, :count)
          .by(1)
      end

      context "with invalid params" do
        it "redirects with alert" do
          post project_comments_path(project), params: { comment: { name: "" } }

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  context "when user is not logged in" do
    describe "POST /create" do
      it "redirects with alert" do
        post project_comments_path(project)

        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end
  end
end
