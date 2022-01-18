import 'package:flutter/material.dart';
import 'package:money_manager/modules/services/models/service_model.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<bool> _isOpen =
      List.generate(servicesList.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Services')),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _isOpen[panelIndex] = !isExpanded;
              });
            },
            children: servicesList.map((service) {
              final index = servicesList.indexOf(service);
              return ExpansionPanel(
                  isExpanded: _isOpen[index],
                  canTapOnHeader: true,
                  headerBuilder: (_, __) => ListTile(
                        title: Text(service.name),
                        subtitle: Text(service.category),
                        trailing: Text(service.priceFormatted),
                      ),
                  body: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text('Fecha de pago: ${service.paymentDay}'),
                    subtitle: Text(
                        'Periodo de pago: ${service.periodPayment.displayText}'),
                  ));
            }).toList(),
          ),
        ));
  }
}

final category = Category(name: 'Entretenimiento').name;

final servicesList = [
  ServiceModel(
      name: 'Spotify',
      price: 179.0,
      periodPayment: PeriodPayment.month,
      paymentDay: 23,
      category: category),
  ServiceModel(
      name: 'YouTube Premium',
      price: 179.0,
      periodPayment: PeriodPayment.month,
      paymentDay: 15,
      category: category),
  ServiceModel(
      name: 'Disney+',
      price: 1600.0,
      periodPayment: PeriodPayment.year,
      paymentDay: 16,
      paymentMonth: 11,
      category: category)
];
