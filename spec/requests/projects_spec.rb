# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Projects", type: :request do
  context "when user is logged in" do
    include_context "when user logged in"

    describe "GET /index" do
      context "when the user is logged in" do
        let!(:project) { create(:project, name: "Example project") }

        it "renders a successful response" do
          get projects_path

          expect(response).to be_successful
          expect(response.body).to include("Example project")
        end
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_project_path

        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      let(:project) { create(:project, user:) }

      it "renders a successful response" do
        get edit_project_path(project)

        expect(response).to be_successful
      end

      context "when project belongs to different user" do
        let(:project) { create(:project) }

        it "redirects with alert" do
          get edit_project_path(project)

          expect(response).to redirect_to("/")
          expect(flash[:alert]).to eq("You are not authorized to perform this action.")
        end
      end
    end

    describe "POST /create" do
      it "redirects with notice" do
        post projects_path, params: { project: attributes_for(:project) }

        expect(response).to redirect_to(projects_path)
        expect(flash[:notice]).to eq("Project was successfully created.")
      end

      it "creates project" do
        expect { post projects_path, params: { project: attributes_for(:project) } }
          .to change(Project, :count)
          .by(1)
      end

      context "with invalid params" do
        it "redirects with alert" do
          post projects_path, params: { project: { name: "" } }

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      let(:project) { create(:project, user:, name: "Example project") }

      it "redirects with notice" do
        patch project_path(project), params: { project: { name: "Update name" } }

        expect(response).to redirect_to(projects_path)
        expect(flash[:notice]).to eq("Project was successfully updated.")
      end

      it "updates the project" do
        expect { patch project_path(project), params: { project: { name: "Update name" } } }
          .to change { project.reload.name }
          .from("Example project")
          .to("Update name")
      end

      context "when project belongs to different user" do
        let(:project) { create(:project) }

        it "redirects with alert" do
          patch project_path(project), params: { project: { name: "Update name" } }

          expect(response).to redirect_to("/")
          expect(flash[:alert]).to eq("You are not authorized to perform this action.")
        end
      end
    end
  end

  context "when user is not logged in" do
    describe "GET /index" do
      it "redirects to the login page" do
        get projects_path

        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    describe "GET /new" do
      it "redirects with alert" do
        get new_project_path

        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    describe "GET /edit" do
      let(:project) { create(:project) }

      it "redirects with alert" do
        get edit_project_path(project)

        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    describe "POST /create" do
      it "redirects with alert" do
        post projects_path

        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    describe "PATCH /update" do
      let(:project) { create(:project) }

      it "redirects with alert" do
        patch project_path(project)

        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end
  end
end
