#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'mechanize'

module Journyx
  class Scrapper
    JOURNYX_URL = "https://growthaccel.apps.journyx.com/jtcgi/wte.pyc"
    attr_reader :username, :password, :project
    def initialize()
      @username = "luisrodriguez" #username
      @password = "firstdjsnip" #password
      @project  = "EAB: Grades First"
    end

    def get_data
      agent = Mechanize.new
      page = agent.get(JOURNYX_URL)
      login_form = page.form('a')
      login_form['wtusername'] = @username
      login_form['wtpassword'] = @password

      puts "Logging in as #{username}"
      page = agent.submit login_form

      task_description =
        page.
        css("#idMainTableLeftbody .rowtype_New").
        css("td[id^=idMainTable]").
        last

      task_description.css("input").first["value"] = "hola"

      task_time =
        page.
        css("#idMainTableRightCell .rowtype_New").
        css("td[id^=idMainTable]")[2].
        css("input").first

      task_time["value"] = "8:30"

      # task_project_select_name =
      #   page.
      #   css("#idMainTableLeftbody .rowtype_New").
      #   css("td[id^=idMainTable]")[0].
      #   css("select").first["name"]

      #time_sheet_form = page.form_with(name: "persist_form")

      # time_sheet_form.
      #   field_with(name: task_project_select_name).options.each do |option|
      #     if option.text.downcase.strip == project.downcase.strip
      #       option.click
      #     end
      #   end

      save_button = time_sheet_form.button_with(id: "enterAction")
      agent.submit(time_sheet_form, save_button)

    end
  end
end
