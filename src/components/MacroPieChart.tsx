import React from 'react';
import { Pie } from 'react-chartjs-2';
import { Chart, ArcElement, Tooltip, Legend } from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

Chart.register(ArcElement, Tooltip, Legend, ChartDataLabels);

interface MacroPieChartProps {
  protein: number;
  carbs: number;
  fats: number;
}

export function MacroPieChart({ protein, carbs, fats }: MacroPieChartProps) {
  const proteinCalories = protein * 4;
  const carbsCalories = carbs * 4;
  const fatsCalories = fats * 9;
  const dataValues = [proteinCalories, carbsCalories, fatsCalories];
  const total = dataValues.reduce((acc, cur) => acc + cur, 0);

  const data = {
    labels: ['Protein', 'Carbs', 'Fat'],
    datasets: [
      {
        data: dataValues,
        backgroundColor: ['#34d399', '#60a5fa', '#facc15'],
        borderWidth: 1,
      },
    ],
  };

  const options = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      datalabels: {
        color: '#fff',
        font: { weight: 'bold' as const },
        formatter: (value: number, context: any) => {
          const label = context.chart.data.labels[context.dataIndex];
          const percentage = ((value / total) * 100).toFixed(0);
          return `${label}\n${percentage}%`;
        },
      },
      legend: { position: 'bottom' as const },
    },
  };

  return <Pie data={data} options={options} />;
}
