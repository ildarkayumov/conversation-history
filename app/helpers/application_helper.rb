# frozen_string_literal: true

module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.update "flash", partial: "layouts/flash"
  end

  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-l-4 border-green-700 text-white",
      alert: "bg-red-400 border-l-4 border-red-700 text-white"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
