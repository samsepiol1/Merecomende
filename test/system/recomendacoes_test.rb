require "application_system_test_case"

class RecomendacoesTest < ApplicationSystemTestCase
  setup do
    @recomendacao = recomendacoes(:one)
  end

  test "visiting the index" do
    visit recomendacoes_url
    assert_selector "h1", text: "Recomendacoes"
  end

  test "should create recomendacao" do
    visit recomendacoes_url
    click_on "New recomendacao"

    fill_in "Artista", with: @recomendacao.artista
    fill_in "Desc", with: @recomendacao.desc
    fill_in "Img", with: @recomendacao.img
    fill_in "Titulo", with: @recomendacao.titulo
    click_on "Create Recomendacao"

    assert_text "Recomendacao was successfully created"
    click_on "Back"
  end

  test "should update Recomendacao" do
    visit recomendacao_url(@recomendacao)
    click_on "Edit this recomendacao", match: :first

    fill_in "Artista", with: @recomendacao.artista
    fill_in "Desc", with: @recomendacao.desc
    fill_in "Img", with: @recomendacao.img
    fill_in "Titulo", with: @recomendacao.titulo
    click_on "Update Recomendacao"

    assert_text "Recomendacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Recomendacao" do
    visit recomendacao_url(@recomendacao)
    click_on "Destroy this recomendacao", match: :first

    assert_text "Recomendacao was successfully destroyed"
  end
end
