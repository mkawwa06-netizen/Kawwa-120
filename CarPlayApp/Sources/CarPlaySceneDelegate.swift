import CarPlay

/// CarPlay-Oberfläche: Tab-Leiste mit Ziel-Liste, Info-Raster und Aktionen.
class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    var interfaceController: CPInterfaceController?

    func templateApplicationScene(_ scene: CPTemplateApplicationScene,
                                  didConnect interfaceController: CPInterfaceController) {
        self.interfaceController = interfaceController
        let tabs = CPTabBarTemplate(templates: [makeListTab(), makeGridTab()])
        interfaceController.setRootTemplate(tabs, animated: true, completion: nil)
    }

    func templateApplicationScene(_ scene: CPTemplateApplicationScene,
                                  didDisconnect interfaceController: CPInterfaceController) {
        self.interfaceController = nil
    }

    // MARK: - Tab 1: Liste

    private func makeListTab() -> CPListTemplate {
        let items: [CPListItem] = ["Zuhause", "Arbeit", "Tanken", "Einkaufen"].map { title in
            let item = CPListItem(text: title, detailText: "Tippen für Details")
            item.handler = { [weak self] _, completion in
                self?.showDetail(for: title)
                completion()
            }
            return item
        }
        let template = CPListTemplate(title: "Ziele", sections: [CPListSection(items: items)])
        template.tabTitle = "Ziele"
        template.tabImage = UIImage(systemName: "list.bullet")
        return template
    }

    private func showDetail(for title: String) {
        let ok = CPAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.interfaceController?.dismissTemplate(animated: true, completion: nil)
        }
        let alert = CPAlertTemplate(titleVariants: ["Ziel: \(title)"], actions: [ok])
        interfaceController?.presentTemplate(alert, animated: true, completion: nil)
    }

    // MARK: - Tab 2: Raster

    private func makeGridTab() -> CPGridTemplate {
        func button(_ title: String, _ symbol: String) -> CPGridButton {
            CPGridButton(titleVariants: [title], image: UIImage(systemName: symbol)!) { [weak self] _ in
                self?.showDetail(for: title)
            }
        }
        let template = CPGridTemplate(title: "Aktionen", gridButtons: [
            button("Anrufen", "phone.fill"),
            button("Nachricht", "message.fill"),
            button("Musik", "music.note"),
            button("Einstellungen", "gearshape.fill")
        ])
        template.tabTitle = "Aktionen"
        template.tabImage = UIImage(systemName: "square.grid.2x2")
        return template
    }
}
