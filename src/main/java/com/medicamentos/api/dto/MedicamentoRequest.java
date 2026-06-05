package com.medicamentos.api.dto;

public class MedicamentoRequest {
    private String nome;
    private String dose;
    private String horario;
    private Integer quantidade;

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDose() { return dose; }
    public void setDose(String dose) { this.dose = dose; }

    public String getHorario() { return horario; }
    public void setHorario(String horario) { this.horario = horario; }

    public Integer getQuantidade() { return quantidade; }
    public void setQuantidade(Integer quantidade) { this.quantidade = quantidade; }
}
