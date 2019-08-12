class ApplicationController < ActionController::API

  def import_poi
    Importer.new(:poi)
  end
end
