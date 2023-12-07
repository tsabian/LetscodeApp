//  LetscodeWidgetProvider.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import WidgetKit

/**
 O TimelineProvider é uma classe utilizada no desenvolvimento de widgets para iOS e é responsável por fornecer os dados que devem ser exibidos no widget ao longo do tempo.

 Ao criar um widget, o desenvolvedor deve definir como os dados serão exibidos no widget e quando eles devem ser atualizados.
 Isso é feito por meio da implementação do protocolo TimelineProvider, que define os métodos necessários para fornecer as entradas de dados para o widget.

 O TimelineProvider define os seguintes métodos:
 */

struct LetscodeWidgetProvider: TimelineProvider {
    typealias Entry = LetscodeWidgetEntry

    /**
     `placeholder(in:)`: define a entrada de dados que deve ser exibida no widget enquanto as informações reais ainda estão sendo carregadas;
     **/
    func placeholder(in context: Context) -> LetscodeWidgetEntry {
        LetscodeWidgetEntry()
    }

    /**
     `getSnapshot(in:completion:)`: retorna uma imagem estática do widget, que pode ser exibida na tela inicial ou na tela de edição do widget;
     **/
    func getSnapshot(in context: Context, completion: @escaping (LetscodeWidgetEntry) -> Void) {
        completion(LetscodeWidgetEntry())
    }

    /**
     getTimeline(in:completion:): retorna as entradas de dados que devem ser exibidas no widget ao longo do tempo.

     No método getTimeline(in:completion:) do protocolo TimelineProvider em um widget iOS, a propriedade policy é utilizada para definir quando as
     entradas de dados fornecidas devem expirar e deixar de ser exibidas no widget.

     Existem três opções de políticas de expiração:
     1 .atEnd: as entradas de dados fornecidas serão exibidas no widget até que a última entrada de dados seja exibida.
     Quando a última entrada de dados expirar, todas as outras entradas de dados serão removidas do widget.
     2 .never: as entradas de dados fornecidas nunca expirarão e permanecerão no widget até que o usuário as remova manualmente ou até que o widget seja excluído.
     3 .after(date): as entradas de dados fornecidas expirarão em uma data e hora específicas.
     O argumento date deve ser definido como um objeto Date que representa a data e hora em que as entradas de dados devem expirar.

     A política de expiração determina por quanto tempo as entradas de dados fornecidas serão exibidas no widget e é importante escolher uma política que seja adequada
     ao conteúdo que está sendo exibido no widget. Por exemplo, uma política .never pode ser adequada para um widget que exibe informações importantes e que o usuário precisa
     ter acesso constante, enquanto uma política .atEnd pode ser mais adequada para um widget que exibe informações que são relevantes apenas por um curto período de tempo.
     **/
    func getTimeline(in context: Context, completion: @escaping (Timeline<LetscodeWidgetEntry>) -> Void) {
        completion(Timeline(entries: [LetscodeWidgetEntry()], policy: .never))
    }
}

/**
 Para atualizar as informações exibidas no widget, o aplicativo principal ou o próprio widget pode chamar o método reloadTimelines() do objeto DataProvider, que solicita
 ao sistema que atualize as informações do widget.

 O uso do TimelineProvider permite que o widget exiba informações atualizadas e relevantes para o usuário, além de permitir que o aplicativo principal ou o próprio
 widget atualize essas informações com facilidade e de acordo com uma programação definida.
 */
