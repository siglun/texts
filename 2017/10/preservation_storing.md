# Formål: Preserving and storing composite digital objects

By a composite digital, are aggregate, object we understand an object that has multiple
interconnected components 

- images of book pages together with metadata for how the object is structured that may include a table of contents and information on whether an object is to be read right to left (RTL) or left to right (LTR)
- digital text together with correlated facsimiles
- digitised photographs with recto and verso

In the following I will refer to a composite object as an aggregate. An aggregate is basically a hypertext document with embedded or linked graphic elements. The collection of TEI files used for Archive for Danish Literature (ADL) would be a typical aggregate here at KB.

## Requirements

The basic requirements for aggregates objects are the same as
for any other preservation. However, during the life cycle of an aggregate we need to

- be able to easily store a whole aggregate __(SIP handling)__
- be able to easily retrieve the aggregate or its members. Upon retrieval all hypertext links should still be valid and so should other references inside and between documents (such as annotations, comments and foot and end notes) __(DIP handling)__

During management

- it should be possible to update members of an aggregate without disturbing the hyperlinks
- it should be possible to migrate members of the structure asynchronously. For example, it should be possible to migrate the facsimiles at one moment in time and the XML content files at another.



