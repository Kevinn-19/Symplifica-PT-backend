require "test_helper"

class BenefitTest < ActiveSupport::TestCase

  test "should be valid with valid attributes" do
    benefit = Benefit.new(
      employee: employees(:one),
      nombre: "Seguro médico",
      monto: 200000
    )

    assert benefit.valid?
  end

  test "should require nombre" do
    benefit = Benefit.new(
      employee: employees(:one),
      monto: 200000
    )

    assert_not benefit.valid?
  end

  test "monto should be greater than zero" do
    benefit = Benefit.new(
      employee: employees(:one),
      nombre: "Seguro",
      monto: 0
    )

    assert_not benefit.valid?
  end

end