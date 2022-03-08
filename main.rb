# frozen_string_literal: true

require 'bundler/setup'
require 'playwright'

LAUNCH_PARAMS = {
  headless: false, acceptDownloads: true, hasTouch: true,
  args: ['--disable-session-crashed-bubble', '--disable-infobars', '--mute-audio', '--ignore-autocomplete-off-autofill'],
  channel: 'chrome', ignoreDefaultArgs: ['--enable-automation'],
  screen: { width: 600, height: 400 },
  viewport: { width: 600, height: 400 },
}.freeze

Playwright.create(playwright_cli_executable_path: './node_modules/.bin/playwright') do |playwright|
  playwright.chromium.launch_persistent_context("./chrome/", **LAUNCH_PARAMS) do |browser|
    browser.new_page.goto("https://www.google.co.jp/")
    sleep 5
  end
end
