#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'mechanize'
require 'phantom_mechanize'

require 'selenium-webdriver'
require 'phantomjs'
require 'watir'

module Journyx
  class PublishSingleTask
    JOURNYX_URL = "https://growthaccel.apps.journyx.com/jtcgi/wte.pyc?TE=1&"

    attr_reader :username, :password, :project, :category, :browser, :description

    def initialize(params = {})
      @username    = params.fetch(:username)
      @password    = params.fetch(:password)
      @project     = params.fetch(:project)
      @category    = params.fetch(:category)
      @description = params.fetch(:description)
      @hours       = params.fetch(:hours)
      @wday        = params.fetch(:wday)
      init_browser
    end

    def post_data
      login
      set_description
      set_project
      sleep 3
      set_category
      set_hours
      submit_form
    end

    private
    def init_browser
      @browser = Watir::Browser.new :phantomjs
      browser.window.maximize
      browser.goto(JOURNYX_URL)
    end

    def login
      browser.text_field(name: "wtusername").set(username)
      browser.text_field(name: "wtpassword").set(password)

      browser.form(name: "a").submit
    end

    def set_description
      left_table = browser.tbody(id: "idMainTableLeftbody")
      description_row = left_table.tr(class: "rowtype_New").tds.last
      description_row.text_fields.first.set(description)
    end

    def set_project
      left_table = browser.tbody(id: "idMainTableLeftbody")
      project_row = left_table.tr(class: "rowtype_New").tds.first

      project_row.select_lists.first.options.each do |option|
        if option.text.downcase.strip == project.downcase.strip
          option.click
        end
      end
    end

    def set_category
      left_table = browser.tbody(id: "idMainTableLeftbody")
      category_row = left_table.tr(class: "rowtype_New").tds[1]
      category_row.select_lists.first.options.each do |option|
        if option.text.downcase.strip == category.downcase.strip
          option.click
        end
      end
    end

    def set_hours
      right_table = browser.tbody(id: "idMainTableRightbody")
      hour_row = right_table.tr(class: "rowtype_New").tds[2]
      hour_row.text_fields.first.set(hours)
    end

    def submit_form
      save_button = browser.input(id: "enterAction")
      save_button.click
      browser.close
    end
  end
end
