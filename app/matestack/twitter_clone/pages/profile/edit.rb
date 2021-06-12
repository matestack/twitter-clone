class TwitterClone::Pages::Profile::Edit < Matestack::Ui::Page

  def response
    div class: "mb-3 p-3 rounded shadow-sm" do
      heading size: 4, text: "Your Profile", class: "mb-3"
      matestack_form form_config_helper do
        div class: "mb-3" do
          form_input key: :username, type: :text, placeholder: "Username", class: "form-control", init: current_username
        end
        div class: "mb-3" do
          button 'submit', type: :submit, class: "btn btn-primary", text: "Save!"
        end
      end
    end
  end

  private

  def form_config_helper
    {
      for: :profile, path: profile_update_path, method: :put,
      success: {emit: "submitted"},
      failure: {emit: "form_failed"},
      errors: {wrapper: {tag: :div, class: 'invalid-feedback'}, input: {class: 'is-invalid'}}
    }
  end

end