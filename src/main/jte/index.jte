@param int total
@param long totalAssistidos

@template.layout.base(titulo = "Início", conteudo = @`
    <section class="hero">

        <div class="hero-texto">

            <span class="sobretitulo">
                <span class="ponto"></span>
                SEU UNIVERSO DE ENTRETENIMENTO
            </span>

            <h1>
                O que vem<br>
                depois dos <em>créditos?</em>
            </h1>

            <p class="hero-descricao">
                Organize os filmes e séries que estão na sua lista.
                Guarde os próximos títulos e acompanhe o que já assistiu.
            </p>

            <div class="hero-acoes">

                <a class="botao botao-principal" href="/filmes/novo">
                    + Adicionar título
                </a>

                <a class="link-seta" href="/filmes">
                    Explorar minha lista ↗
                </a>

            </div>

        </div>

        <div class="hero-poster">

            <div class="poster-circulo"></div>
            <div class="poster-linha"></div>

            <div class="poster-conteudo">
                <span class="poster-tag">YOUR NEXT STORY</span>
                <span class="poster-simbolo">✳</span>

                <span class="poster-legenda">
                    MAKE TIME<br>
                    FOR STORIES.
                </span>
            </div>

            <span class="poster-numero">01 / WATCHLIST</span>

        </div>

    </section>

    <section class="resumo">

        <div class="resumo-cabecalho">

            <div>
                <span class="sobretitulo">VISÃO GERAL</span>
                <h2>Sua coleção</h2>
            </div>

            <span class="atualizado">DADOS EM MEMÓRIA</span>

        </div>

        <div class="metricas">

            <article class="metrica">
                <span class="metrica-icone">▤</span>
                <span class="metrica-numero">${total}</span>
                <span class="metrica-label">Títulos cadastrados</span>
            </article>

            <article class="metrica metrica-destaque">
                <span class="metrica-icone">◷</span>

                <span class="metrica-numero">
                    ${total - totalAssistidos}
                </span>

                <span class="metrica-label">Na fila para assistir</span>
            </article>

            <article class="metrica">
                <span class="metrica-icone">✓</span>
                <span class="metrica-numero">${totalAssistidos}</span>
                <span class="metrica-label">Já assistidos</span>
            </article>

        </div>

    </section>

    <section class="faixa-convite">

        <div>
            <span class="sobretitulo">SEM IDEIAS PARA HOJE?</span>
            <h2>Seu próximo favorito pode estar na lista.</h2>
        </div>

        <a class="botao botao-claro" href="/filmes">
            Ver títulos ↗
        </a>

    </section>
`)