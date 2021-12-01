module Book.Book exposing (main)

import Book.CounterChapter as CounterChapter
import Book.FirstChapter as FirstChapter
import Book.InputChapter as InputChapter
import ElmBook as B
import ElmBook.StatefulOptions as BS


type alias SharedState =
    { inputModel : InputChapter.Model
    , counterModel : CounterChapter.Model
    }


initialState : SharedState
initialState =
    { inputModel = InputChapter.init
    , counterModel = CounterChapter.init
    }


main : B.Book SharedState
main =
    B.book "Stateful Book"
        |> B.withStatefulOptions
            [ BS.initialState initialState
            ]
        |> B.withChapters
            [ FirstChapter.firstChapter
            , CounterChapter.chapter
            , InputChapter.chapter
            ]
