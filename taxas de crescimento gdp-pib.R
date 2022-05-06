#########Taxas de Crescimento do Produto Interno Bruto (PIB) 2000-2015 #########
#########J.Victor Sobrinho########


### Carregando as bibliotecas:
library(ggplot2)
library(lubridate)
library(scales)
library (RColorBrewer)


tabpib<-read.csv('txcrescimento.csv', header = T) ### Carregando a base de dados.

dftabpib <- subset(tabpib, select = c('Argentina', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Venezuela')) ### Selecionando países e salvando em uma variável.


Anos<-seq.Date(from = as_date("2000-01-01"),
               to = as_date("2015-01-01"),
               "year")
df = data.frame(Anos, dftabpib) ### Organizando o data frame.


ggplot(data = df, aes(x = Anos)) + ### Definindo o "X" do gráfico.
  theme_linedraw()+ ### Fundo do gráfico.
  geom_line(aes(y= Argentina, colour = "Argentina"), size =.8)+ ### Y, Nome da linha, Espessura da linha.
  geom_point(aes(y = Argentina))+ ### Colocando pontos nas linhas.
  geom_line(aes(y= Brazil, colour="Brasil"),size=.8) +
  geom_point(aes(y = Brazil))+
  geom_line(aes(y= Chile, colour="Chile"),size=.8) +
  geom_point(aes(y = Chile))+
  geom_line(aes(y= Colombia, colour="Colômbia"),size=.8) +
  geom_point(aes(y = Colombia))+
  geom_line(aes(y= Ecuador, colour="Equador"),size=.8) +
  geom_point(aes(y = Ecuador))+
  geom_line(aes(y= Guyana, colour="Guiana"),size=.8) +
  geom_point(aes(y = Guyana))+
  geom_line(aes(y= Paraguay, colour="Paraguai"),size=.8) +
  geom_point(aes(y = Paraguay))+
  geom_line(aes(y= Venezuela, colour="Venezuela"),size=.8) +
  geom_point(aes(y = Venezuela))+
  geom_hline(yintercept=0, colour='black', linetype='longdash', size= 0.88)+ ### Criando uma linha horizontal ao nível zero.
  labs(x='Anos', y='Crescimento Econômico (%)', ### "Rótulos".
       title='Taxas de Crescimento',subtitle = '(2000-2015)',
       caption='Autor: J.Victor mediado por Dr. Dinilson Pedroza', color = "") + ### Nota de rodapé.
  theme (plot.title = element_text(size=14, face='bold', hjust = 0.5, family = "mono"))+ ### Estilo do título.
  theme (plot.subtitle = element_text(size = 13, face = 'bold', hjust = 0.5, family = "mono" ))+ ### Estilo do subtítulo.
  theme (axis.text.x = element_text(size = 10, face="bold", color="black", angle=45, hjust = 1, family = "mono")) + ### Design de "x".
  theme (axis.text.y = element_text(size=10, face="bold", color="black",angle=0, family = "mono")) + ### Design de "y".
  theme (legend.position = "bottom") + ### Posição da legenda.
  scale_x_date(date_labels = "%Y", breaks = date_breaks("1 year"))+ ### Espaçamento de "x".
  scale_color_brewer(palette = "Spectral")  ### Paleta de cores Spectral ### Finalizado



