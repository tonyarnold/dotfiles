import UIKit
import PlaygroundSupport
import NaturalLanguage

// NOTE: after loading for the first time, this playground will take 45-60 seconds before it can run

struct TextFieldViewState: CodableContainer {
	let text: Var<String>
	init() {
		text = Var("")
	}
}

func textFieldView(_ textFieldViewState: TextFieldViewState) -> ViewControllerConvertible {
	return ViewController(
		.view -- View(
			.backgroundColor -- .white,
			.layout -- .center(
				alignment: .center,
				marginEdges: .allLayout,
				breadth: .equalTo(ratio: 1.0),
				.view(
					Label(
						.font -- UIFont.preferredFont(forTextStyle: .callout, weight: .semibold),
						.text <-- textFieldViewState.text.allChanges().keyPath(\.statistics)
					)
				),
				.space(),
				.view(
					breadth: .equalTo(ratio: 1.0),
					TextField(
						.text <-- textFieldViewState.text,
						.textChanged() --> textFieldViewState.text.update(),
						.borderStyle -- .roundedRect
					)
				)
			)
		)
	)
}

private extension String {
	var statistics: String {
		let labelFormat = NSLocalizedString("Field contains %ld characters and %ld words.", comment: "")
		let tokenizer = NLTokenizer(unit: .word)
		tokenizer.string = self
		let wordCount = tokenizer.tokens(for: startIndex..<endIndex).count
		return .localizedStringWithFormat(labelFormat, count, wordCount)
	}
}

PlaygroundPage.current.liveView = textFieldView(TextFieldViewState()).uiViewController()