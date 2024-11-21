using { com.org.satinfotech as db } from '../db/schema';

service infotech {
    entity Week as projection on db.Week;
    entity materials as projection on db.Week.materials {
        *,
        Fieldcontrol
    }
}

annotate infotech.Week with @odata.draft.enabled;

annotate infotech.Week with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Label: 'WeekId',
            Value: weekID
        },
        {
            $Type: 'UI.DataField',
            Value: weekDate
        }
    ],
);

annotate infotech.Week with @(
    UI.FieldGroup #ProductInformation: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: weekID
            },
            {
                $Type: 'UI.DataField',
                Value: weekDate
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'ProductInfoFacet',
            Label: 'Week Information',
            Target: '@UI.FieldGroup#ProductInformation',
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'MaterialInfoFacet',
            Label: 'Material Information',
            Target: 'materials/@UI.LineItem',
        }
    ]
);

annotate infotech.materials with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Label: 'Material',
            Value: material
        },
        {
            $Type: 'UI.DataField',
            Label: 'Batch',
            Value: batch
        },
        {
            $Type: 'UI.DataField',
            Label: 'BON',
            Value: bon
        },
        {
            $Type: 'UI.DataField',
            Label: 'Length',
            Value: length
        },
        {
            $Type: 'UI.DataField',
            Label: 'Size',
            Value: size
        },
        {
            $Type: 'UI.DataField',
            Label: 'Quantity',
            Value: quantity
        }
    ]
);

annotate infotech.materials with {
    material @Common.FieldControl: Fieldcontrol;
};

annotate infotech.materials with @(
    UI.FieldGroup #MaterialInformation: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Material',
                Value: material
            },
            {
                $Type: 'UI.DataField',
                Label: 'Batch',
                Value: batch
            },
            {
                $Type: 'UI.DataField',
                Label: 'BON',
                Value: bon
            },
            {
                $Type: 'UI.DataField',
                Label: 'Length',
                Value: length
            },
            {
                $Type: 'UI.DataField',
                Label: 'Size',
                Value: size
            },
            {
                $Type: 'UI.DataField',
                Label: 'Quantity',
                Value: quantity
            }
        ]
    }
);
