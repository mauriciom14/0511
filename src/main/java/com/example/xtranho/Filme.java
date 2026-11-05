package com.example.xtranho;

import java.time.LocalDate;

public record Filme(
        long id,
        String nome,
        String tipo,
        String genero,
        String plataforma,
        LocalDate dataPrevista,
        boolean assistido,
        LocalDate dataAssistido,
        int nota
) {

    public Filme comId(long novoId) {
        return new Filme(
                novoId, nome, tipo, genero, plataforma,
                dataPrevista, assistido, dataAssistido, nota
        );
    }

    public Filme marcarComoAssistido() {
        return new Filme(
                id, nome, tipo, genero, plataforma,
                dataPrevista, true, LocalDate.now(), nota
        );
    }

    public Filme comNota(int novaNota) {
        return new Filme(
                id, nome, tipo, genero, plataforma,
                dataPrevista, assistido, dataAssistido, novaNota
        );
    }
}