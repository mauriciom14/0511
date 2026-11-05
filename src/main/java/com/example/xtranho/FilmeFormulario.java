package com.example.xtranho;

import java.time.LocalDate;

public record FilmeFormulario(
        String nome,
        String tipo,
        String genero,
        String plataforma,
        LocalDate dataPrevista
) {
}