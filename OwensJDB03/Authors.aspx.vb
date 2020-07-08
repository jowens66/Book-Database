
Partial Class Authors
    Inherits System.Web.UI.Page

    Protected Sub FVAuthors_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FVAuthors.ItemDeleted
        GVAuthors.DataBind()
    End Sub

    Protected Sub FVAuthors_ItemDeleting(sender As Object, e As FormViewDeleteEventArgs) Handles FVAuthors.ItemDeleting
        Dim Lname As String
        Dim Fname As String
        Dim Answer As MsgBoxResult

        Lname = CStr(e.Values("Lname"))
        Fname = CStr(e.Values("Fname"))
        Answer = MsgBox("Are you Sure you want to delete this Author record" & vbNewLine & Fname & " " & Lname & "?", MsgBoxStyle.YesNo, "Confirm Deletion")

        If Answer = MsgBoxResult.No Then
            e.Cancel = True
        Else
            e.Cancel = False
        End If

    End Sub

    Protected Sub FVAuthors_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FVAuthors.ItemInserted
        GVAuthors.DataBind()
    End Sub

    Protected Sub FVAuthors_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FVAuthors.ItemUpdated
        GVAuthors.DataBind()
    End Sub

    
End Class
