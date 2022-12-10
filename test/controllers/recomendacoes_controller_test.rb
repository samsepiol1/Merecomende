require "test_helper"

class RecomendacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recomendacao = recomendacoes(:one)
  end

  test "should get index" do
    get recomendacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_recomendacao_url
    assert_response :success
  end

  test "should create recomendacao" do
    assert_difference("Recomendacao.count") do
      post recomendacoes_url, params: { recomendacao: { artista: @recomendacao.artista, desc: @recomendacao.desc, img: @recomendacao.img, titulo: @recomendacao.titulo } }
    end

    assert_redirected_to recomendacao_url(Recomendacao.last)
  end

  test "should show recomendacao" do
    get recomendacao_url(@recomendacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_recomendacao_url(@recomendacao)
    assert_response :success
  end

  test "should update recomendacao" do
    patch recomendacao_url(@recomendacao), params: { recomendacao: { artista: @recomendacao.artista, desc: @recomendacao.desc, img: @recomendacao.img, titulo: @recomendacao.titulo } }
    assert_redirected_to recomendacao_url(@recomendacao)
  end

  test "should destroy recomendacao" do
    assert_difference("Recomendacao.count", -1) do
      delete recomendacao_url(@recomendacao)
    end

    assert_redirected_to recomendacoes_url
  end
end
