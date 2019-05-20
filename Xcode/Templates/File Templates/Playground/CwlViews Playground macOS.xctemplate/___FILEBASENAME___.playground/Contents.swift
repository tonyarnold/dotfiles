import AppKit
import PlaygroundSupport
import NaturalLanguage

// NOTE: after loading for the first time, this playground will take 45-60 seconds before it can run

struct TextFieldViewState: CodableContainer {
	let text: Var<String>
	init() {
		text = Var("")
	}
}

func textFieldView(_ textFieldViewState: TextFieldViewState) -> ViewConvertible {
	return View(
		.layout -- .center(
			.view(
				TextField.wrappingLabel(
					.font -- .preferredFont(forTextStyle: .label, size: .controlSmall, weight: .semibold),
					.stringValue <-- textFieldViewState.text.allChanges().keyPath(\.statistics)
				)
			),
			.space(),
			.view(
				breadth: .ratio(1.0, constant: -16),
				TextField(
					.stringValue <-- textFieldViewState.text,
					.stringChanged() --> textFieldViewState.text.update()
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

PlaygroundPage.current.liveView = textFieldView(TextFieldViewState()).nsView(width: 400, height: 300)