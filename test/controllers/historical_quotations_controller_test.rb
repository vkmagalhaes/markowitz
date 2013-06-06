require 'test_helper'

class HistoricalQuotationsControllerTest < ActionController::TestCase
  setup do
    @historical_quotation = historical_quotations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historical_quotations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historical_quotation" do
    assert_difference('HistoricalQuotation.count') do
      post :create, historical_quotation: { codbdi: @historical_quotation.codbdi, codisi: @historical_quotation.codisi, codneg: @historical_quotation.codneg, cry_date: @historical_quotation.cry_date, datven: @historical_quotation.datven, dismes: @historical_quotation.dismes, especi: @historical_quotation.especi, fatcot: @historical_quotation.fatcot, indopc: @historical_quotation.indopc, modref: @historical_quotation.modref, nomres: @historical_quotation.nomres, prazot: @historical_quotation.prazot, preabe: @historical_quotation.preabe, preexe: @historical_quotation.preexe, premax: @historical_quotation.premax, premed: @historical_quotation.premed, premin: @historical_quotation.premin, preofc: @historical_quotation.preofc, preofv: @historical_quotation.preofv, preult: @historical_quotation.preult, ptoexe: @historical_quotation.ptoexe, quatot: @historical_quotation.quatot, totneg: @historical_quotation.totneg, tpmerc: @historical_quotation.tpmerc, voltot: @historical_quotation.voltot }
    end

    assert_redirected_to historical_quotation_path(assigns(:historical_quotation))
  end

  test "should show historical_quotation" do
    get :show, id: @historical_quotation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historical_quotation
    assert_response :success
  end

  test "should update historical_quotation" do
    patch :update, id: @historical_quotation, historical_quotation: { codbdi: @historical_quotation.codbdi, codisi: @historical_quotation.codisi, codneg: @historical_quotation.codneg, cry_date: @historical_quotation.cry_date, datven: @historical_quotation.datven, dismes: @historical_quotation.dismes, especi: @historical_quotation.especi, fatcot: @historical_quotation.fatcot, indopc: @historical_quotation.indopc, modref: @historical_quotation.modref, nomres: @historical_quotation.nomres, prazot: @historical_quotation.prazot, preabe: @historical_quotation.preabe, preexe: @historical_quotation.preexe, premax: @historical_quotation.premax, premed: @historical_quotation.premed, premin: @historical_quotation.premin, preofc: @historical_quotation.preofc, preofv: @historical_quotation.preofv, preult: @historical_quotation.preult, ptoexe: @historical_quotation.ptoexe, quatot: @historical_quotation.quatot, totneg: @historical_quotation.totneg, tpmerc: @historical_quotation.tpmerc, voltot: @historical_quotation.voltot }
    assert_redirected_to historical_quotation_path(assigns(:historical_quotation))
  end

  test "should destroy historical_quotation" do
    assert_difference('HistoricalQuotation.count', -1) do
      delete :destroy, id: @historical_quotation
    end

    assert_redirected_to historical_quotations_path
  end
end
