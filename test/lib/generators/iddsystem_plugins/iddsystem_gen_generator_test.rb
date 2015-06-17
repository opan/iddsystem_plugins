require 'test_helper'
require 'generators/iddsystem_gen/iddsystem_gen_generator'

module IddsystemPlugins
  class IddsystemGenGeneratorTest < Rails::Generators::TestCase
    tests IddsystemGenGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
