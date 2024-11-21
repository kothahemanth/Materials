namespace com.org.satinfotech;

using { managed, cuid } from '@sap/cds/common';

entity Week : managed {
    @title: 'Week ID'
    key weekID: String(10);
    @title: 'Week Date'
    weekDate: Date;
    @title: 'Material Details'
    materials: Composition of many {
        @title: 'ID'
        key ID: UUID;
        @title: 'Material'
        material: String(20);
        @title: 'Batch'
        batch: String(10);
        @title: 'BON'
        bon: String(10);
        @title: 'Length'
        length: Decimal(10,2); 
        @title: 'Size'
        size: Decimal(10,2);
        @title: 'Quantity'
        quantity: Decimal(10,2);
        @title: 'Field Control'
        Fieldcontrol: Integer;
    }
}