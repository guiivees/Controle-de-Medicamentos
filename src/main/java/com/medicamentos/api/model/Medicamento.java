package com.medicamentos.api.model;

public class Medicamento {
    private Long id;
    private String nome;
    private String dose;
    private String horario;
    private Integer quantidade;

    public Medicamento(Long id, String nome, String dose, String horario, Integer quantidade) {
        this.id = id;
        this.nome = nome;
        this.dose = dose;
        this.horario = horario;
        this.quantidade = quantidade;
    }

    public Long getId() { return id; }
    public String getNome() { return nome; }
    public String getDose() { return dose; }
    public String getHorario() { return horario; }
    public Integer getQuantidade() { return quantidade; }
}
