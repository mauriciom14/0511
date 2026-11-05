@import com.example.xtranho.Filme
@import java.util.List

@param List<Filme> filmes
@param String busca

@template.layouts.base(titulo = "Minha lista", conteudo = @`
    <section class="pagina-cabecalho cabecalho-com-acao">

        <div>
            <span class="sobretitulo">SUA BIBLIOTECA / 01</span>

            <h1>Minha <em>lista.</em></h1>

            <p>
                Todos os títulos que ainda estão esperando
                pela sua próxima sessão.
            </p>
        </div>

        <a class="botao botao-principal" href="/filmes/novo">
            + Novo título
        </a>

    </section>

    <form class="busca" method="get" action="/filmes">

        <label for="busca">Buscar na watchlist</label>

        <div class="busca-controle">

            <span>⌕</span>

            <input
                    type="search"
                    id="busca"
                    name="busca"
                    value="${busca}"
                    placeholder="Digite o nome de um filme ou série..."
            >

            <button type="submit">Buscar</button>

        </div>

    </form>

    <div class="lista-cabecalho">
        <span>TÍTULO E INFORMAÇÕES</span>
        <span>PREVISÃO</span>
        <span>STATUS</span>
    </div>

    <section class="lista-itens">

        @if (filmes.isEmpty())

            <div class="estado-vazio">
                <span>✳</span>

                <h2>Nenhum título por aqui.</h2>

                <p>
                    Adicione um filme ou uma série
                    para começar sua coleção.
                </p>

                <a class="botao botao-principal" href="/filmes/novo">
                    Adicionar primeiro título
                </a>
            </div>

        @else

            @for (Filme filme : filmes)

                <article class="item-filme">

                    <div class="item-identidade">

                        <span class="item-tipo">
                            ${filme.tipo().equals("Filme") ? "FIL" : "SER"}
                        </span>

                        <div>
                            <h2>${filme.nome()}</h2>

                            <p>
                                ${filme.genero()}
                                ·
                                ${filme.plataforma()}
                            </p>
                        </div>

                    </div>

                    <div class="item-data">
                        ${filme.dataPrevista() == null
                            ? "Não definida"
                            : filme.dataPrevista().toString()}
                    </div>

                    <div class="item-status">

                        <span class="status status-pendente">
                            ● Na fila
                        </span>

                        <form
                                method="post"
                                action="/filmes/${filme.id()}/assistir"
                        >
                            <button class="botao-marcar" type="submit">
                                Marcar como assistido ✓
                            </button>
                        </form>

                    </div>

                </article>

            @endfor

        @endif

    </section>
`)