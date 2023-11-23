class ProponentsController < ApplicationController
  def index
    @proponents = Proponent.order(:full_name).page(params[:page])
    @chart = {
      'Primeira Faixa Salarial': Proponent.by_salary_band(:first_band).count,
      'Segunda Faixa Salarial': Proponent.by_salary_band(:second_band).count,
      'Terceira Faixa Salarial': Proponent.by_salary_band(:third_band).count,
      'Quarta Faixa Salarial': Proponent.by_salary_band(:fourth_band).count,
      'Não Processados': Proponent.by_salary_band(:processing).count
    }
  end

  def create
  end

  def update
  end
end
