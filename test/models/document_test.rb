require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "should not save document without uploader" do
    document = Document.new
    assert_not document.save
  end

  test "should save document with uploader" do
    document = Document.new
    document.uploader = "iamtesting"
    assert document.save
  end
end
