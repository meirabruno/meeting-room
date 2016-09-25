# frozen_string_literal: true
Slim::Embedded.register :es6, Slim::Embedded::JavaScriptEngine, engine: Slim::Embedded::TiltEngine

if Rails.env.development?
  Slim::Engine.set_options pretty: true, sort_attrs: false
end
